import firebase from "firebase"; 



const firebaseApp = firebase.initializeApp({
    apiKey: "AIzaSyA_p77vf4hxR4QALZrN5ALfo06M_08iUx4",
    authDomain: "insta-clone-9e50d.firebaseapp.com",
    databaseURL: "https://insta-clone-9e50d.firebaseio.com",
    projectId: "insta-clone-9e50d",
    storageBucket: "insta-clone-9e50d.appspot.com",
    messagingSenderId: "759015544151",
    appId: "1:759015544151:web:fd53427061af1531535a12",
    measurementId: "G-CWHZLHJLX2"
  });

  const db=firebaseApp.firestore();
  const auth= firebase.auth();
  const storage= firebase.storage();

 export{ db, auth, storage };
