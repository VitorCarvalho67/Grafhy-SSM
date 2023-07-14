<template>
    <main>
        <div class="box">
        <h1>Criar Comunicado</h1>
        <form @submit.prevent="criarComunicado">
            <div class="input-box">
                <label for="title">Título:</label>
                <input type="text" id="title" v-model="titleComunicado" required>
            </div>
            <div class="input-box">
                <label for="message">Mensagem:</label>
                <textarea id="message" v-model="messageComunicado" required></textarea>
            </div>
            <div class="input-box">
                <label for="file">Arquivo:</label>
                <input type="file" id="file" ref="fileInput" @change="previewFile" accept=".jpg, .jpeg, .png">
            </div>
            <div class="box-router">
                <button type="submit">Criar</button>
            </div>
            
        </form>
    </div>
    <div class="box">
        <!-- pré visualição da img -->
        <img :src="previewImage" alt="Preview" v-if="previewImage"/>
    </div>    
    </main>

</template>
  
<script>
import axios from 'axios';
import { defineComponent, ref, onMounted, nextTick, watch } from 'vue';
export default defineComponent({
    name: 'Input',
    data() {
        return {
            titleComunicado: '',
            messageComunicado: '',
            previewImage: null
        };
    },
    //     curl --request POST \
    //   --url https://apigrafhy.favela.network/comunicado/ \
    //   --header 'Content-Type: multipart/form-data' \
    //   --form message_comunicado=dwadwdadawd \
    //   --form title_comunicado=awdawdawdawd \
    //   --form 'file_arquivo=@C:\Users\User\Documents\Lightshot\Screenshot_1.png'
    methods: {
        previewFile() {
            const file = this.$refs.fileInput.files[0];
            if (file) {
                this.previewImage = URL.createObjectURL(file);
            } else {
                this.previewImage = null;
            }
        },
        async criarComunicado() {
            const formData = new FormData();
            formData.append('title_comunicado', this.titleComunicado);
            formData.append('message_comunicado', this.messageComunicado);
            if (this.$refs.fileInput.files.length > 0) {
                formData.append('file_arquivo', this.$refs.fileInput.files[0]); // Aqui é a mudança
            }

            try {
                const response = await axios.post('https://apigrafhy.favela.network/comunicado/', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });

                console.log('Comunicado criado:', response.data);
                // limpar os campos
                this.titleComunicado = '';
                this.messageComunicado = '';
                this.previewImage = null;
                this.$refs.fileInput.value = null;

                // Faça algo com a resposta do servidor, como exibir uma mensagem de sucesso ou redirecionar para outra página
            } catch (error) {
                console.error('Erro ao criar comunicado:', error);
                // Faça algo com o erro, como exibir uma mensagem de erro ao usuário
            }
        }
    }

});
</script>
  

<!-- the rest of your code -->


<style scoped>
h1,h2, h3 {
    color: white;
}

h1{
    color: rgb(68, 182, 102);
}

main {
    display: flex;
    flex-direction: row;
    justify-content: space-around;
    align-items: center;
    height: 90vh;
}

.box {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    width: 40%;
    height: 80%;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.box form {
    display: flex;
    flex-direction: column;
    justify-content: space-around;
    align-items: center;
    width: 90%;
    height: 70%;
}
.box img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.box-router {
    display: flex;
    justify-content: flex-end;
    align-items: center;
    padding: 2rem;
    width: 100%;
}

.box-router button {
    text-decoration: none;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    transition: all 0.3s ease;
    border: 1px solid rgb(68, 75, 77);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    letter-spacing: 0.1rem;
}

.box-router button:hover {
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.box p {
    padding: 0.5rem;
    font-size: 11px;
}

.input-box {
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    align-items: center;
    margin: 2rem;
    width: 90%;
}

.input-box input, .input-box textarea {
    margin: 0.5rem;
    padding: 0.5rem;
    width: 25rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}

.input-box label {
    font-size: 20px;
    letter-spacing: 0.1rem;
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