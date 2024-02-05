<template>
    <Header />
    <div class="register-box">
        <h2>Register</h2>
        <form @submit.prevent="registerUser">
            <div class="box">
                <!-- pré visualição da img -->
                <img :src="userData.previewImage" alt="Preview" v-if="userData.previewImage"/>
            </div>   
            <div>
                <label for="name">Name:</label>
                <input id="name" type="text" v-model="userData.name_users" required />
            </div>
            <div>
                <label for="email">Email:</label>
                <input id="email" type="email" v-model="userData.email_users" required />
            </div>
            <div>
                <label for="password">Password:</label>
                <input id="password" type="password" v-model="userData.password_users" required />
            </div>
            <div>
                <label for="photo">Photo:</label>
                <input id="photo" type="file" @change="previewImage" accept="image/png, image/jpeg">
            </div>
            <button type="submit">Register</button>
        </form>
        <p v-if="successMessage">{{ successMessage }}</p>
    </div>
    <Footer />
</template>
  
<script>
import { ref } from 'vue';
import { registerUser } from '../services/api';
import { useRouter } from 'vue-router';
import axios from 'axios';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';

export default {
    name: 'Register',
    setup() {
        const userData = ref({
            name_users: '',
            email_users: '',
            password_users: '',
            photo_users: null, // Mudança para aceitar o objeto File
            previewImage: null
        });
        const errorMessage = ref('');
        const successMessage = ref('');

        const previewImage = function(event) {
            const file = event.target.files[0];
            userData.value.photo_users = file;
            userData.value.previewImage = URL.createObjectURL(file);
        };

        const performRegistration = async () => {
            const formData = new FormData();
            formData.append('name_users', userData.value.name_users);
            formData.append('email_users', userData.value.email_users);
            formData.append('password_users', userData.value.password_users);
            if (userData.value.photo_users) {
                // Certifique-se de que 'file_photo' corresponde ao nome do parâmetro no endpoint FastAPI
                formData.append('file_photo', userData.value.photo_users, userData.value.photo_users.name);
            }


            try {
                const response = await axios.post('http://localhost:9999/users/', formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                });
                console.log('User registered:', response.data);
                successMessage.value = 'Usuário registrado com sucesso!';
                // Limpeza dos campos e redirecionamento são mantidos
            } catch (error) {
                errorMessage.value = error.message;
                // Limpeza dos campos em caso de erro é mantida
            }
        };

        return {
            userData,
            errorMessage,
            successMessage,
            registerUser: performRegistration,
            previewImage
        };
    },
    components: {
        Header,
        Footer
    }
};
</script>
  
<style scoped>
.register-box {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    margin: 2rem;
    padding: 2rem;
    height: 85vh;
    border: 1px solid rgb(68, 75, 77);
    border-radius: 5px;
}

h2 {
    margin: 0.5rem;
    letter-spacing: 0.1rem;
}

form {
    display: flex;
    flex-direction: column;
    align-items: center;
}

form div {
    display: flex;
    flex-direction: column;
    margin: 0.5rem;
}

.box{
    margin: 5px;
}

.box img {
    width: 100px;
    height: 100px;
    border-radius: 50%;
}

input {
    padding: 0.5rem;
    width: 20rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
}

button {
    margin: 0.5rem;
    padding: 0.5rem;
    border-radius: 5px;
    border: 1px solid rgb(68, 75, 77);
    background-color: #ccc;
    color: #fff;
    cursor: pointer;
}

button:hover {
    background-color: #fff;
    color: #000;
}
</style>
  