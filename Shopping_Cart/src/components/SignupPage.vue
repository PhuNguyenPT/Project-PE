<template>
    <div class="container">
        <body>
            <form id="signup-form" @submit.prevent="handleSubmit">

                <h1>Sign up</h1>

                <div class="input-field">
                    <label for="First Name">First Name:</label>
                    <input type="text"  required v-model="FirstName">
                </div>

                <div class="input-field">
                    <label for="Last Name">Last Name:</label>
                    <input type="text" required v-model="LastName">
                </div>


                <div class="input-field">
                    <label for="email-username">Email or Username:</label>
                    <input type="text" required v-model="Email">
                </div>

                <div class="input-field">
                    <label for="password">Password:</label>
                    <input type="password" required v-model="Password">
                    <div v-if="passError">{{ passError }}</div>
                </div>

                <div class="input-field">
                    <label for="confirmed-password">Confirmed Password:</label>
                    <input type="password" required v-model="ConfirmedPassword">
                    <div v-if="passError">{{ passError }}</div>
                </div>
                <button type="submit" class="btn-continue">Continue</button>
            </form>
        </body>
    </div>
</template>

<script>
export default {
    data(){
        return {
            FirstName:'',
            LastName:'',
            Email: '',
            Password:'',
            ConfirmedPassword:'',
            passError:''
        }
    },
    methods: {
        handleSubmit(){
            //validate pass
            this.passError = this.Password == this.ConfirmedPassword ? '' : 'Password must be the same'
            
            if(!this.passError) {
                let json = {
                    "firstName": this.FirstName,
                    "lastName": this.LastName,
                    "email": this.Email,
                    "password": this.Password
                }

                const options = {
                    method: 'POST',
                    headers: {'Content-Type': 'application/json'},
                    body: JSON.stringify(json),
                };

                fetch('https://localhost:443/api/v1/auth/register', options)
                .then(response => response.json())
                .then(response => {
                    if (!response.length){
                        this.$router.push('./RegisterAuthentication');
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

body {
    font-family: Arial, sans-serif;
    background-color: #fff;
    margin: 0;
    padding: 0;

}


header h1 {
    margin: 0;
}

form {
    background-color: #fff;
    padding: 30px;
    border-radius: 5px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    width: 400px;
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

.signup-link {
    margin-top: 20px;
    text-align: center;
}

.signup-link a {
    color: #007185;
    text-decoration: none;
}
</style>