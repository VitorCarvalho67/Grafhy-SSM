<template>
    <div id="app">
        <Header />

        <main>
            <div class="box">
                <h1>Hello to the dashboard</h1>
                <h2> {{ user }} </h2>
                <h3> {{ password }} </h3>
                <div class="box-router">
                    <p>Area de postagens de novos comunicados.</p>
                    <router-link to="/admin">Admin</router-link>
                </div>
            </div>
            <div class="box">
                <img :src="img" alt="img1">
            </div>
            
        </main>

        <Footer />

        <router-view />
    </div>
</template>

<script>
import auth from '../mixins/auth';
import Header from '../components/Header.vue';
import Footer from '../components/Footer.vue';
import { loginUser } from '../services/api';
import Img1 from '../assets/imgs/img2.jpg';

export default {
    name: 'Dashboard',
    mixins: [auth],
    components: {
        Header,
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
            password: null,
            img: Img1
        }
    }
};
</script>

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
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
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

.box-router a {
    text-decoration: none;
    padding: 10px;
    margin: 5px;
    border-radius: 5px;
    transition: all 0.3s ease;
    border: 1px solid white;
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
    letter-spacing: 0.1rem;
}

.box-router a:hover {
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.box p {
    padding: 0.5rem;
    font-size: 11px;
}
</style>
