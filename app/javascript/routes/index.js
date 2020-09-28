import VueRouter from "vue-router";
import store from '../vuex/store'
import signup from '../components/signup'
import signin from '../components/signin'
import posts from '../components/posts'
import profile from '../components/profile'
import homepage from '../components/homepage';
import friendRequests from '../components/friendRequests';


const routes = [
    { name: "root", path: "/", component: homepage},
    { name: "signup", path: '/signup', component: signup},
    { name: "posts", path: '/posts', component: posts },
    { name: "signin", path: '/signin', component: signin },
    { name: "profile", path: '/user/:id', component: profile },
    { name: "friend-requests", path: '/friend_requests', component: friendRequests },

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