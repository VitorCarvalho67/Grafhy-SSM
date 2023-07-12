<template>
    <div>
      <div class="outer-container" ref="container">
        <div class="mensagens" ref="content">
          <div class="mensagem" v-for="message in messages" :key="message.id">
            <p>{{ message.message }}</p>
            <p>{{ message.date_message }}</p>
          </div>
        </div>
      </div>
  
      <div class="input-box">
        <input type="text" v-model="messageInput" placeholder="Digite sua mensagem" required>
        <button type="submit" @click="sendMessage">Enviar</button>
      </div>
      
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { defineComponent, ref, onMounted, nextTick, watch } from 'vue';
  
  export default defineComponent({
    name: 'Chat',
    setup() {
      const messages = ref([]);
      const containerRef = ref(null);
      const contentRef = ref(null);
      const messageInput = ref('');
      const id_group = ref(2);
      const id_users = ref(13);
      const date_message = ref(new Date().toISOString().slice(0, 19).replace('T', ' '));
  
      onMounted(async () => {
        try {
          await fetchMessages();
          nextTick(() => {
            containerRef.value.scrollTop = contentRef.value.offsetHeight;
          });
        } catch (error) {
          console.error(error);
        }
      });
  
      watch(messages, () => {
        nextTick(() => {
          containerRef.value.scrollTop = contentRef.value.offsetHeight;
        });
      });
  
      async function fetchMessages() {
        try {
          const response = await axios.get('http://localhost:8000/menssages/group/2');
          messages.value = response.data.reverse(); // Reverse the order of the messages
        } catch (error) {
          console.error(error);
        }
      }
  
      async function sendMessage() {
        try {
          const requestBody = {
            id_groups: id_group.value,
            id_users: id_users.value,
            message: messageInput.value,
            date_message: date_message.value
          };
          console.log("Request body:", requestBody);
  
          const response = await axios.post('http://localhost:8000/menssages/', requestBody);
          console.log("Response:", response);
          messageInput.value = '';  // Clear the message input field.
          await fetchMessages(); // Fetch the updated messages
        } catch (error) {
          console.error("Error:", error);
          if (error.response) {
            console.error("Error data:", error.response.data);
            console.error("Detail:", error.response.data.detail);
          }
        }
      }
  
      return { messages, containerRef, contentRef, messageInput, id_group, id_users, date_message, sendMessage };
    },
  });
  </script>
  
  <style scoped>
  .outer-container {
    height: 60vh;
    overflow-y: auto;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .mensagens {
    height: 100%;
  }
  
  .mensagem {
    height: auto;
    margin: 1rem;
    padding: 1rem;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .input-box {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin: 2rem;
    padding: 2rem;
    height: 20vh;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  
  .input-box input {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 20rem;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  
  .input-box button {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 5rem;
    border-radius: 5px;
    border: 1px solid #ccc;
  }
  </style>
  