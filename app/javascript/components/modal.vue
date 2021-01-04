<template>
  <section>
    <button
      class="button is-primary is-small"
      @click="isComponentModalActive = true"
    >
      {{ buttonText }}
    </button>

    <b-modal
      v-model="isComponentModalActive"
      has-modal-card
      @close-modal="closeModal"
      trap-focus
      :destroy-on-hide="false"
      aria-role="dialog"
      aria-modal
    >
      <template>
        <slot name="content" />
      </template>
    </b-modal>
  </section>
</template>

<script>
import signup from "./signup";
const ModalForm = {
  props: ["email", "password", "canCancel"],
};

export default {
  props: ["buttonText", "modalContent"],
  methods: {
    closeModal() {
      this.isComponentModalActive = false;
    },
  },
  components: {
    ModalForm,
    "sign-up": signup,
  },
  data() {
    return {
      isComponentModalActive: false,
    };
  },
};
</script>
