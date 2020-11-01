import React,{useState, useEffect} from 'react';
//import logo from './logo.svg';
import './App.css';
import Post from './Post';
import { db, auth } from './firebase';
import { Modal, Button, Input } from '@material-ui/core';
import {makeStyles} from '@material-ui/core/styles'
import ImageUpload from './ImageUpload';
import InstagramEmbed from 'react-instagram-embed';
//import { auth } from 'firebase';
//import {Button} from '@material-ui/core'
//import Modal from '@material-ui/core/Modal'

function getModalStyle() {
  const top = 50 ;
  const left = 50;

  return {
    top: `${top}%`,
    left: `${left}%`,
    transform: `translate(-${top}%, -${left}%)`,
  };
}

const useStyles = makeStyles((theme) => ({
  paper: {
    position: 'absolute',
    width: 400,
    backgroundColor: theme.palette.background.paper,
    border: '2px solid #000',
    boxShadow: theme.shadows[5],
    padding: theme.spacing(2, 4, 3),
  },
}));




function App() {
  const classes= useStyles();
  const [modalStyle]=useState(getModalStyle);
  const [openSignIn, setopenSignIn]=useState(false);
  const [posts, setPosts]= useState([]);
  const[open, setOpen]=useState(false);
  const[username, setUsername]=useState(false);
  const[password, setPassword]=useState(false);
  const[email, setEmail]=useState(false);
  const[user, setUser]=useState(null);

  useEffect(()=>{
   const unsubscribe = auth.onAuthStateChanged((authUser)=>{
      if (authUser){
        //user has logged in
        console.log(authUser);
        setUser(authUser);

      }else{
        //user has logged out
        setUser(null);

      }
    })
    return()=>{
      //perform some cleanup action
      unsubscribe();

    }
  
  },[user, username]);

  useEffect(() => {
    db.collection('posts').orderBy('timestamp','desc').onSnapshot(snapshot => {
      //This code runs everytime a new post is added.
      setPosts(snapshot.docs.map(doc => ({
        id: doc.id,
        post:doc.data()
      })))
    })
  },[]);

  const signUp=(event)=>{
    event.preventDefault();
    auth
    .createUserWithEmailAndPassword(email,password)
    .then((authUser)=>{
      return authUser.user.updateProfile({
        displayName:username
      })
    })
    .catch((error)=>alert(error.message));

    setOpen(false);
   

  }

  const signIn=(event)=>{
    event.preventDefault();
    auth
      .signInWithEmailAndPassword(email, password)
      .catch((error)=>alert(error.message))
    
    setopenSignIn(false);

  }

  return (
    <div className="App"> 
      
      
      <Modal
      open={open}
      onClose={() => setOpen(false)}
      >
      <div style={modalStyle} className={classes.paper}>
        <form className="app__signup">
              <center>
                <img
                className="app_headerImage"
                src="https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png"
                alt="">
                </img>
                </center>
                <Input
                placeholder="username"
                type="text"
                value={username}
                onChange={(e)=> setUsername(e.target.value)}
                />
                <Input
                placeholder="email"
                type="text"
                value={email}
                onChange={(e)=> setEmail(e.target.value)}
                />
                <Input
                placeholder="password"
                type="password"
                value={password}
                onChange={(e)=> setPassword(e.target.value)}
                
                />
                <Button type="submit" onClick={signUp}>Sign Up</Button>
              
          
         </form>
          </div>
      </Modal>

      <Modal
      open={openSignIn}
      onClose={() => setopenSignIn(false)}
      >
      <div style={modalStyle} className={classes.paper}>
        <form className="app__signup">
              <center>
                <img
                className="app_headerImage"
                src="https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png"
                alt="">
                </img>
                </center>
    
                <Input
                placeholder="email"
                type="text"
                value={email}
                onChange={(e)=> setEmail(e.target.value)}
                />
                <Input
                placeholder="password"
                type="password"
                value={password}
                onChange={(e)=> setPassword(e.target.value)}
                
                />
                <Button type="submit" onClick={signIn}>Sign In</Button>
              
          
         </form>
          </div>
      </Modal>
      
      {/*Header */}
      <div className="app__header">
        <img
        className="app__headerImage"
        src="https://www.instagram.com/static/images/web/mobile_nav_type_logo.png/735145cfe0a4.png"
        alt="">
        </img>

        {user ?(
          <Button onClick={()=> auth.signOut()}>Logout</Button>
        ):(
          <div className="app__logincontainer">
            <Button onClick={()=> setopenSignIn(true)}>Sign In</Button>
            <Button onClick={()=> setOpen(true)}>Sign Up</Button>
            </div>


          )}
        </div> 
       
          
        <div className="app__posts">
          <div className="app_postsLeft">
              {
            posts.map(({id,post}) => (
              <Post key={id} postId={id} user={user} username={post.username} caption={post.caption} imageUrl={post.imageUrl}/>
            ))
          }

          </div>
          <div className="app__postsRight">
          <InstagramEmbed
            url='https://www.instagram.com/p/B8OfhxxjPyF/'
            maxWidth={320}
            hideCaption={false}
            containerTagName='div'
            protocol=''
            injectScript
            onLoading={() => {}}
            onSuccess={() => {}}
            onAfterRender={() => {}}
            onFailure={() => {}}
          />
            
          </div>
      


        </div>
        
  



      {/*Header */}
      
      
      {user?.displayName ? (
        <ImageUpload username={user.displayName} />
      ): (
        <h3><center>Sorry you need to be logged in.</center></h3>
      )}
      
    </div>
  );
}
export default App;
