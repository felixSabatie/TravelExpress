<template>
  <div class="edit-account container">
    <h3>Modifier mes informations</h3>
    <form @submit.prevent="saveAccount">
      <div class="row">
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
        <div class="input-field col s6">
          <i class="material-icons prefix">email</i>
          <input v-model="account.email" id="email" type="email" class="validate" required>
          <label for="email">Adresse email</label>
        </div>
        <div class="input-field col s6">
          <i class="material-icons prefix">phone</i>
          <input v-model="account.phone" id="phone" type="text" class="validate">
          <label for="phone">Téléphone</label>
        </div>
      </div>

      <button class="btn right">Valider</button>
    </form>
  </div>
</template>

<script>
  import {mapGetters, mapActions} from 'vuex'
  import axios from '../../axios-wrapper'
  import {serverAddress} from '../../env'
  import M from 'materialize-css'

  export default {
    computed: {
      ...mapGetters(['account'])
    },
    mounted() {
      M.updateTextFields()
    },
    methods: {
      ...mapActions(['setCurrentAccount']),
      saveAccount() {
        axios.put(`${serverAddress}/api/accounts/${this.account.id}`, this.account).then(() => {
          this.setCurrentAccount(this.account)
          M.toast({html: 'Les modifications ont bien été enregistrées'})
        }).catch(error => {
          console.error(error)
        })
      }
    }
  }
</script>

<style lang="scss">

</style>
