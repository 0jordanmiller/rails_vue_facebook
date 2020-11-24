import Vue from 'vue';
import Vuex from 'vuex';

Vue.use(Vuex);

export default new Vuex.Store({
    state: {
        user: null,
        auth: {}
    },
    mutations: {
        user (state, value) {
            state.user = value
        },
        auth (state, value) {
            state.auth = value
        },
        signOut(state) {
            state.user = null
        }
    },
    actions: {
        signIn(state, payload) {
            state.user = payload
        },
        signOut(state) {
            state.user = null
        }
    },
    getters: {
        user: state => state.user,
        auth: state => state.auth,
    },

})
