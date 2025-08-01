<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8" />
  <title>Connexion - Réserve ton pain</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #fff8f0;
      padding: 50px;
      color: #333;
    }
    h2 {
      color: #d2691e;
      text-align: center;
    }
    form {
      max-width: 400px;
      margin: auto;
      padding: 30px;
      background: #fff;
      border-radius: 8px;
      box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    }
    input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
      box-sizing: border-box;
    }
    button {
      background-color: #ff7f50;
      color: white;
      padding: 10px;
      border: none;
      width: 100%;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }
    button:hover {
      background-color: #e65c2f;
    }
    #error {
      color: red;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>
<body>

  <h2>Connexion</h2>

  <form id="loginForm">
    <input type="email" id="email" placeholder="Email" required />
    <input type="password" id="password" placeholder="Mot de passe" required />
    <button type="submit">Se connecter</button>
    <div id="error"></div>
  </form>

  <!-- Firebase -->
  <script src="https://www.gstatic.com/firebasejs/10.5.2/firebase-app-compat.js"></script>
  <script src="https://www.gstatic.com/firebasejs/10.5.2/firebase-auth-compat.js"></script>

  <script>
    const firebaseConfig = {
      apiKey: "TA_CLÉ_API",
      authDomain: "TON-PROJET.firebaseapp.com",
      projectId: "TON-PROJET",
    };

    firebase.initializeApp(firebaseConfig);

    const form = document.getElementById('loginForm');
    const error = document.getElementById('error');

    form.addEventListener('submit', (e) => {
      e.preventDefault();
      const email = form.email.value;
      const password = form.password.value;

      firebase.auth().signInWithEmailAndPassword(email, password)
        .then(() => {
          window.location.href = "reservetonpain_site.html"; // Redirection vers la page principale
        })
        .catch((err) => {
          error.textContent = "Erreur : " + err.message;
        });
    });
  </script>

</body>
</html>
