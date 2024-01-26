<template>
    <div class="outer-container" ref="container">
        <H1>Comunicados</H1>
      <div class="mensagens" ref="content">
        <div class="mensagem" v-for="message in messages" :key="message.id">
          <p>{{ message.message }}</p>
          <p>{{ message.date_message }}</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { defineComponent, ref, onMounted, nextTick, watch } from 'vue';
  
  export default defineComponent({
    name: 'Show',
    setup() {
      const message = ref([]);
      const date_message = ref(null);
      const nome_arquivo = ref(null);
  
      onMounted(async () => {
        try {
          const response = await axios.get('http://localhost:9999/comunicados/');
          messages.value = response.data.reverse(); // Reverse the order of the messages
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
  
      return { messages, containerRef, contentRef };
    },
  });
  </script>
  
  <style scoped>

  h1 {
    text-align: center;
    font-size: 2rem;
    margin: 0.5rem;
    padding: 0.5rem;
  }
  .outer-container {
    height: 90vh;
    overflow-y: auto;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
  }
  
  .mensagens {
    height: 90%;
    display: flex;
    align-items: center;
    flex-direction: column;
  }
  
  .mensagem {
    height: auto;
    width: 70%;
    min-height: 400px;
    margin: 1rem;
    padding: 1rem;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
  }

  
  </style>