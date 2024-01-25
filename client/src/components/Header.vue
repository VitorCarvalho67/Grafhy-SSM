<template>
    <header>
        <div class="logo">
            <img src="https://github.com/VitorCarvalho67/Grafhy-Vue-FastAPI/assets/102667323/a10aa288-747e-4b3f-9ca5-1d7da1fba175" alt="Logo" />
        </div>
        <nav>
            <router-link to="/">Home</router-link>
            <router-link to="/login">Login</router-link>
            <router-link to="/dashboard">Dashboard</router-link>
            <router-link to="/chat">Chat</router-link>
            <router-link to="/post">Post</router-link>
        </nav>
    </header>
</template>

<script>
import { defineComponent } from 'vue';
import { useRoute } from 'vue-router';

export default defineComponent({
    name: 'Header',
    setup() {
        const route = useRoute();
        return {
            route
        }
    }
});

</script>

<style scoped>

header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 1rem;
    background-color: rgb(30, 32, 33);
    color: rgb(197, 197, 197);
}

.logo img {
    height: 50px;
    /* quero add o efeito de luz padrão do vue e vite com tauri */
}

nav {
    display: flex;
    gap: 1rem;
}

nav a {
    text-decoration: none;
    padding: 5px;
    margin: 5px;
    border-radius: 5px;
    transition: all 0.3s ease;
    border: 1px solid rgb(68, 75, 77);
    color: white;
    display: flex;
    align-items: center;
    justify-content: center;
}

nav a.active {
    background-color: white;
    color: black;
}

</style>