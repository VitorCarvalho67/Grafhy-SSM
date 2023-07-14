<template>
  <div>
    <h1>Criar Comunicado</h1>
    <form @submit.prevent="criarComunicado">
      <div>
        <label for="title">Título:</label>
        <input type="text" id="title" v-model="titleComunicado" required>
      </div>
      <div>
        <label for="message">Mensagem:</label>
        <textarea id="message" v-model="messageComunicado" required></textarea>
      </div>
      <div>
        <label for="file">Arquivo:</label>
        <input type="file" id="file" ref="fileInput" accept=".jpg, .jpeg, .png">
      </div>
      <button type="submit">Criar</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data() {
    return {
      titleComunicado: '',
      messageComunicado: ''
    };
  },
  methods: {
    async criarComunicado() {
      const formData = new FormData();
      formData.append('title_comunicado', this.titleComunicado);
      formData.append('message_comunicado', this.messageComunicado);
      if (this.$refs.fileInput.files.length > 0) {
        formData.append('file_arquivo', this.$refs.fileInput.files[0]);
      }

      try {
        const response = await axios.post('/comunicado/', formData, {
          headers: {
            'Content-Type': 'multipart/form-data'
          }
        });
        console.log('Comunicado criado:', response.data);
        // Faça algo com a resposta do servidor, como exibir uma mensagem de sucesso ou redirecionar para outra página
      } catch (error) {
        console.error('Erro ao criar comunicado:', error);
        // Faça algo com o erro, como exibir uma mensagem de erro ao usuário
      }
    }
  }
};
</script>

  
  
  

<!-- the rest of your code -->


<style scoped>
.input-box {
    display: flex;
    flex-direction: row;
    justify-content: center;
    align-items: center;
    margin: 2rem;
    padding: 2rem;
    height: 20vh;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
}

.input-box input {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 20rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}

.input-box button {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 5rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}
</style> 

<!-- quero fazer um pagina de add novos comunicados com imgs e pdfs além de mensagem e a data -->