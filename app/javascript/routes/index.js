import app from '../components/app'
import example from '../components/example'
import signup from '../components/signup'
import signin from '../components/signin'
import posts from '../components/posts'

export default [
    { path: "/foo", component: example }, 
    { path: "/", component: app },
    { path: '/signup', component: signup},
    { path: '/posts', component: posts },
    { path: '/signin', component: signin }


];
