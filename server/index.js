//import from packages
const express =require("express")
const mongoose=require("mongoose")
const cors = require('cors')

//import from other files
const authRouter=require("./routes/auth")

//INIT
const app=express()
port=3000;
app.use(cors())
//MONGOOSE CONNECTION
mongoose.connect("mongodb://127.0.0.1:27017/book-store").then(()=>{
    console.log("connection successful")
}).catch(e=>{console.log(e)
})


//middleware
app.use(express.json())
app.use(authRouter)





app.listen(port,"0.0.0.0",()=>{
    console.log(`connected to the server at ${port}`)
 
})