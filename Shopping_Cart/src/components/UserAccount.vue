<template>
    <div class="user-account">
      <h1>User Account Details</h1>
  
      <div v-if="loading">Loading...</div>
  
      <div v-if="user">
        <div><strong>User ID:</strong> {{ user.id }}</div>
        <div><strong>First Name:</strong> {{ user.firstName }}</div>
        <div><strong>Last Name:</strong> {{ user.lastName }}</div>
        <div><strong>Date of Birth:</strong> {{ user.dateOfBirth }}</div>
        <div><strong>Phone Number:</strong> {{ user.phoneNumber }}</div>
        <div><strong>Email:</strong> {{ user.email }}</div>
        <div>
          <strong>Address:</strong>
          <ul>
            <li><strong>House Number:</strong> {{ user.address.houseNumber }}</li>
            <li><strong>Street Name:</strong> {{ user.address.streetName }}</li>
            <li><strong>Ward Name:</strong> {{ user.address.wardName }}</li>
            <li><strong>City:</strong> {{ user.address.city }}</li>
            <li><strong>Zip Code:</strong> {{ user.address.zipCode }}</li>
          </ul>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  export default {
    data() {
      return {
        user: null,
        loading: false
      };
    },
    mounted() {
      this.fetchUserData();
    },
    methods: {
      fetchUserData() {
        this.loading = true;
        // Replace 'fetchUserAccountData' with your actual method for API call
        this.fetchUserAccountData()
          .then(user => {
            this.user = user;
            this.loading = false;
          })
          .catch(error => {
            console.error('Error fetching user data:', error);
            this.loading = false;
          });
      },
      fetchUserAccountData() {
        // Replace with your actual API endpoint
        const apiUrl = 'https://localhost/api/v1/users/account';
        return fetch(apiUrl, {
          headers: {
            Authorization: `Bearer ${localStorage.getItem('accessToken')}` // Assuming token stored in localStorage
          }
        })
          .then(response => {
            if (!response.ok) {
              throw new Error('Failed to fetch user data');
            }
            return response.json();
          })
          .then(data => data) // Assuming the response is directly the user object
          .catch(error => {
            console.error('Error fetching user account data:', error);
            throw error;
          });
      }
    }
  };
  </script>
  
  <style scoped>
  /* Add your custom styles here */
  .user-account {
    max-width: 600px;
    margin: 0 auto;
    padding: 20px;
    border: 1px solid #ccc;
    border-radius: 5px;
  }
  .user-account h1 {
    font-size: 1.5rem;
    margin-bottom: 20px;
  }
  .user-account ul {
    list-style: none;
    padding-left: 0;
  }
  .user-account ul li {
    margin-bottom: 5px;
  }
  </style>
  