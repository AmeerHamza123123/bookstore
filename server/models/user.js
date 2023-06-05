const express=require("express")
const mongoose=require("mongoose")


//SCHEMA
const userSchema=mongoose.Schema({
    name:{
        type:String,
        required:[true,"please enter the name"],
        trim:true
    },
    email:{
        type:String,
        trim:true,
        required:true,
        validate:{
            validator:(value)=>{
                const re=  /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(re)
            },
            message:"please enter valid email address"
        }
    },
    password:{
        type:String,
        required:true
    },
    address:{
        type:String,
        default:""
    },
    type:{
        type:String,
        default:"user"
    }
    //cart
})
const User=mongoose.model("User",userSchema);
module.exports=User;