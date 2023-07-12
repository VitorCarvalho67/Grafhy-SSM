<template>
    <Header />

    <main>
        <Input />
    </main>

    <Footer />
</template>
<script>
import axios from 'axios';
import { defineComponent } from 'vue';
import Header from '../components/Header.vue';
import Input from '../components/Post/Input.vue';
import Footer from '../components/Footer.vue';
import { loginUser } from '../services/api';

export default defineComponent({
    name: 'Admin',
    setup() {
        return {
        };
    },
    components: {
        Header,
        Input,
        Footer
    },
    created() {
        // estou mandando os dados do usuário para o localStorage quando ele logar, então aqui eu pego esses dados e coloco na variável user
        this.user = JSON.parse(localStorage.getItem('user'));
        this.password = JSON.parse(localStorage.getItem('password'));
        this.checkUser();

    },
    methods: {
        checkUser() {
            if (!this.user) {
                this.$router.push({ name: 'Login' });
            } else {
                const user = {
                    email_users: this.user,
                    password_users: this.password
                }
                loginUser(user)
                    .then(response => {
                        console.log(response)
                    })
                    .catch(error => {
                        this.$router.push({ name: 'Login' });
                    })
            }
        },
    },
    data() {
        return {
            user: null,
            password: null
        }
    }
    

});

</script>
<style scoped>
main {
    min-height: 90vh;
}

</style>