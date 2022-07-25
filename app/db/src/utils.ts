import { PubSub, Message } from '@google-cloud/pubsub';
import db, { MessageSchema } from './db';

const subscriptionNameOrId = process.env.SUBSCRIPTION || 'api-events';
const timeout = process.env.TIMEOUT_SECONDS
  ? parseInt(process.env.TIMEOUT_SECONDS, 10)
  : 60;

const pubSubClient = new PubSub();

const subscription = pubSubClient.subscription(subscriptionNameOrId);

async function sleep(waitMilliseconds: number) {
  return new Promise((resolve) => setTimeout(resolve, waitMilliseconds));
}

async function createMessage(data: MessageSchema) {
  return db.Message.create(data);
}

async function listenForMessages() {
  let messageCount = 0;

  const messageHandler = (message: Message) => {
    const data = JSON.parse(message.data.toString());
    console.log(`Received message ${message.id}:`);
    console.log(`Data:\n${JSON.stringify(data, null, 2)}`);
    console.log(`Attributes: ${JSON.stringify(message.attributes, null, 2)}`);
    messageCount += 1;

    createMessage({
      msgId: message.id,
      msg: data.msg,
      attributes: message.attributes,
    })
      .then(() => message.ack())
      .catch(console.error);
  };

  subscription.on('message', messageHandler);

  while (true) {
    await sleep(timeout * 1000).then(() => {
      console.log(`${messageCount} message(s) received.`);
      messageCount = 0;
    });
  }
}

export { listenForMessages, createMessage };