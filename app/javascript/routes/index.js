import VueRouter from "vue-router";
import store from '../vuex/store'
// import app from '../components/app'
import signup from '../components/signup'
import signin from '../components/signin'
import posts from '../components/posts'
import homepage from '../components/homepage';

const routes = [
    { name: "root", path: "/", component: homepage},
    { name: "signup", path: '/signup', component: signup},
    { name: "posts", path: '/posts', component: posts },
    { name: "signin", path: '/signin', component: signin }
];

const router = new VueRouter({
    routes,
});

router.beforeEach((to, from, next) => {
    if (to.path !== "/" && !store.state.user) {
        next('/')
    } else {
        next()
    }
})

export default router