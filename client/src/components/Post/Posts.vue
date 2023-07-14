<template>
    <div>
      <h1>Comunicados</h1>
      <ul>
        <li v-for="comunicado in comunicados" :key="comunicado.id">
          <div class="box">
            <h2>{{ comunicado.title_comunicado }}</h2>
            <p>{{ comunicado.message_comunicado }}</p>
          </div>
          <div class="box">
            <img :src="recriarImagem(comunicado.file_arquivo, comunicado.type_arquivo)" :alt="comunicado.name_arquivo">
          </div>
          
        </li>
      </ul>
    </div>
  </template>
  
  <script>
  import axios from 'axios';
  import { defineComponent, ref, onMounted, nextTick, watch } from 'vue';
  
  export default defineComponent({
  name: 'Posts',
  inheritAttrs: false,  // adicionado aqui
  data() {
    return {
      comunicados: []
    };
  },
  mounted() {
    this.getComunicados();
  },
  methods: {
    async getComunicados() {
      try {
        const response = await axios.get('http://localhost:8000/comunicado/');
        this.comunicados = response.data;
      } catch (error) {
        console.error('Erro ao obter comunicados:', error);
      }
    },
    recriarImagem(fileArquivo, typeArquivo) {
      if (!fileArquivo) {
        return ''; // ou substitua por uma imagem de erro
      }
      const base64Image = `data:image/${typeArquivo};base64,${fileArquivo}`;
      return base64Image;
    }
  }
});

  </script>
  

<style scoped>
h1, h2, h3 {
    color: white;
}

h1 {
    color: rgb(68, 182, 102);
    padding: 2rem;
    text-align: center;
}

ul {
    list-style: none;
    padding: 0;
}

li {
    margin: 1rem 1rem;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    height: 70vh;
}

.box {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    margin: 2rem;
    padding: 2rem;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
    height: 90%;
    width: 45%;
}

h2 {
    text-align: center;
    font-size: 2rem;
    margin: 0.5rem;
    padding: 0.5rem;
    color: rgb(68, 182, 102);
}
img {
    height: 99%;
    width: 99%;
    border-radius: 0.5rem;
    object-fit: cover;
}
</style>