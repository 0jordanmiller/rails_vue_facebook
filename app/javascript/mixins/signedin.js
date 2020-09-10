export default {
    methods: {
        signedIn: function() {
            return this.$store.state.user;
        }
    }
}