<template>
  <div class="login">
    <h2>Se connecter</h2>
    <authentification-form :isAlreadyRegistered="true" ></authentification-form>
  </div>
</template>

<script>
  import AuthentificationForm from "./authentificationForm";
  export default {
    name: "Login",
    components: {AuthentificationForm}
  }
</script>

<style scoped>

</style>