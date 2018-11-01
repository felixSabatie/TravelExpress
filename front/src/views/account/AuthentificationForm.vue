<template>
  <div class="authentificationForm">
    <form @submit.prevent="sendForm">
      <div v-if="!this.isAlreadyRegistered" class="row">
        <div class="input-field col s6">
          <i class="material-icons prefix">account_circle</i>
          <input v-model="account.first_name" id="first_name" type="text" class="validate" required>
          <label for="first_name">Prénom</label>
        </div>
        <div class="input-field col s6">
          <input v-model="account.last_name" id="last_name" type="text" class="validate" required>
          <label for="last_name">Nom de famille</label>
        </div>
      </div>
      <div class="row">
        <div class="input-field col s12">
          <i class="material-icons prefix">email</i>
          <input v-model="account.email" id="email" type="text" class="validate" required>
          <label for="email">Adresse email</label>
        </div>
      </div>
      <div class="row">
        <div  class="input-field col s12">
          <i class="material-icons prefix">lock</i>
          <input v-model="account.password" id="password" type="text" min="6" class="validate" required>
          <label for="password">Mot de passe</label>
        </div>
      </div>
      <div v-if="!this.isAlreadyRegistered" class="row">
        <div  class="input-field col s12">
          <i class="material-icons prefix">verified_user</i>
          <input v-model="account.password_confirmation" id="password_confirmation" type="text" min="6" class="validate" required>
          <label for="password">Confirmer votre mot de passe</label>
        </div>
      </div>

      <button class="right btn">Valider</button>
      <router-link v-if="!this.isAlreadyRegistered" to="Login">Se connecter</router-link>
      <router-link v-else to="Register">S'inscrire</router-link>

    </form>
  </div>
</template>

<script>
  import axios from 'axios'
  import {serverAddress} from '../../env'
  export default {
    data: () => {
      return {
        account: {
          first_name: "",
          last_name: "",
          email: "",
          password: "",
          password_confirmation: "",
        }
      }
    },
    props: {
      isAlreadyRegistered : Boolean
    },
    methods: {
      sendForm() {
        if(this.isAlreadyRegistered){//login
          axios.post(`${serverAddress}/api/account_token`, {
            auth: {
              email: this.account.email,
              password: this.account.password
            }
          }).then(response => {
            console.log(response);
          }).catch(error => {
            console.error(error)
          })
        }
        else{//register
          axios.post(`${serverAddress}/api/accounts`, {
            account: this.account,
          }).then(response => {
            console.log(response);
            // this.$router.push({name: 'new_lift' /*, params: {id: response.data.id}*/})//TODO: check what data to send and to which view
          }).catch(error => {
            console.error(error)
          })
        }
      },
    }
  }
</script>

<style scoped>

</style>