<template>
  <div class="container">
      <form id="signin-form" @submit.prevent="handleSubmit">
      <h1>Admin - Sign in</h1>
      <div class="input-field">
          <label for="email-username">Email or Username:</label>
          <input type="text" required v-model="Email">
          <div v-if="loginError">{{ loginError }}</div>
      </div>

      <div class="input-field">
          <label for="password">Password:</label>
          <input type="password" required v-model="Password">
          <div v-if="passError">{{ passError }}</div>
      </div>

      <button type="submit" class="btn-continue">Continue</button>
  </form>
  </div>
  
</template>

<script>
import store from '../store'

export default {
  data(){
          return {
              Email: '',
              Password:'',
              loginError:'',
              passError:''
          }
      },
      methods: {
          handleSubmit(){                
              this.passError = this.Password.length > 7 ? '' : 'Password must be 8 chars or more'

              if(!this.passError){
                  let json = {
                      "email": this.Email,
                      "password": this.Password,
                  }

                  const options = {
                      method: 'POST',
                      headers: {'Content-Type': 'application/json'},
                      body: JSON.stringify(json),
                  };

              
                  fetch('https://localhost:443/api/v1/auth/login', options)
                  .then(response => response.json())
                  .then(response => {
                      console.log(response)
                      if(response.error){
                          this.loginError = response.error;
                      }
                      else{
                          store.mutations.setToken(response.token)
                          store.mutations.setEmail(this.Email)
                          this.$router.push('/admindashboard');
                      }
                      
                  })
                  .catch(err => console.error(err));
              }

              
          }
      }
}
</script>


<style>
.container {
    /* display: flex; */
    justify-content: center;
    align-items: center;
}

header h1 {
    margin: 0;
}

.signin-form {
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    justify-content: center;
    align-items: center;
    margin-top: 80px;
    margin-left: auto;
    margin-right: auto;
}

h1 {
    text-align: center;
    margin-bottom: 20px;
}

.input-field {
    margin-bottom: 20px;    
    width: 580px;
}

.input-field label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

.input-field input {
    width: 100%;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 3px;
}

.btn-continue {
    background-color: #000000;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 3px;
    cursor: pointer;
    width: 100%;
    font-size: 16px;
}

</style>