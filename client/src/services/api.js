import axios from 'axios';
import router from '../router/index.js';

// quero usar um redirecionamento para a página dashboard após o login

const api = axios.create({
  baseURL: 'http://localhost:8000', // Insira a URL base do seu backend aqui
});

export const registerUser = async (userData) => {
  try {
    const response = await api.post('/users/', userData);
    return response.data;
  } catch (error) {
    throw new Error(error.response.data.detail);
  }
};

export const loginUser = async (credentials) => {
    try {
      const response = await api.post('/login/', credentials);
      return response.data;
    } catch (error) {
      throw new Error(error.response.data.detail);
    }
};
  
export const getUser = async (userId) => {
  try {
    const response = await api.get(`/users/${userId}`);
    return response.data;
  } catch (error) {
    throw new Error(error.response.data.detail);
  }
};

export const updateUser = async (userId, userData) => {
  try {
    const response = await api.put(`/users/${userId}`, userData);
    return response.data;
  } catch (error) {
    throw new Error(error.response.data.detail);
  }
};

export const deleteUser = async (userId) => {
  try {
    await api.delete(`/users/${userId}`);
  } catch (error) {
    throw new Error(error.response.data.detail);
  }
};

export const getMessages = async () => {
    try {
        const response = await api.get('/messages/');
        return response.data;
    } catch (error) {
        throw new Error(error.response.data.detail);
    }
};

export const createMessage = async (messageData) => {
    try {
        const response = await api.post('/messages/', messageData);
        return response.data;
    } catch (error) {
        throw new Error(error.response.data.detail);
    }
};

export const comunicado = async (messageData) => {
    try {
        const response = await api.post('/comunicado/', messageData);
        return response.data;
    } catch (error) {
        throw new Error(error.response.data.detail);
    }
};

export const getComunicado = async () => {
    try {
        const response = await api.get('/comunicado/');
        return response.data;
    } catch (error) {
        throw new Error(error.response.data.detail);
    }
};

export const Solicitation_Enter = async (users) => {
    try {
        const response = await api.post('/solicitation/', users);
        return response.data;
    } catch (error) {
        throw new Error(error.response.data.detail);
    }
};

// Adicione aqui outras funções para interagir com a API do backend, se necessário

export default api;
