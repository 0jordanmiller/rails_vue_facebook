import VueRouter from "vue-router";
import app from '../components/app'
import example from '../components/example'
import signup from '../components/signup'
import signin from '../components/signin'
import posts from '../components/posts'

const routes = [
    { path: "/foo", component: example }, 
    { path: "/", component: app },
    { path: '/signup', component: signup},
    { path: '/posts', component: posts },
    { path: '/signin', component: signin }
];

const router = new VueRouter({
    mode: "history",
    routes,
});

export default router