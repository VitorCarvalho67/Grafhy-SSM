import { createRouter, createWebHistory } from 'vue-router';
import Home from '../views/Home.vue';
import Register from '../views/Register.vue';
import Login from '../views/Login.vue';
import Dashboard from '../views/Dashboard.vue';
import Chat from '../views/Chat.vue';
import Admin from '../views/Admin.vue';
import Post from '../views/Post.vue';
import Teste from '../views/Teste.vue';

const routes = [
  {
    path: '/',
    name: 'Home',
    component: Home
  },
  {
    path: '/register',
    name: 'Register',
    component: Register
  },
  {
    path: '/login',
    name: 'Login',
    component: Login
  },
  {
    path: '/dashboard',
    name: 'Dashboard',
    component: Dashboard
  },
  {
    path: '/chat',
    name: 'Chat',
    component: Chat
  },
  {
    path: '/admin',
    name: 'Admin',
    component: Admin
  },
  {
    path: '/post',
    name: 'Post',
    component: Post
  },
  {
    path: '/teste',
    name: 'Teste',
    component: Teste
  }
];

const router = createRouter({
  history: createWebHistory(),
  routes
});

export default router;

