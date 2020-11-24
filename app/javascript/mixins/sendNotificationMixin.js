import axios from "../backend";

export default {
  methods: {
    notify(action, sender, recipient, post) {
      axios
        .post("/notifications", {
          params: {
            action: action,
            sender: sender,
            user_id: recipient,
            post_id: post,
            unread: true,
          },
        })

        .then((res) => {
          console.log(res);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
};
