const route = require('express').Router();
const {db}=require('../Database/database')
const uuid= require('uuid');

route.post('/registration',(req,res,next)=>{
    console.log(req.body);
    const formData=req.body;
    const formDataKeys = Object.keys(formData);
    const formDataValues = Object.values(formData);
    const values = formDataKeys.map((key) => "?");
    if(formData.id==''){
        db.raw(`insert into chatusers (${formDataKeys.join(",")}) values(${values.join(
            ","
          )})`,[...formDataValues]).then((data)=>{
            console.log(data);
            res.send({ status:true,
                msg:'data inserted'})
          }).catch(err => {
            console.log(err);
            res.send({
                status:true,
                msg:'data insertion failed due to some cause'
            })
          })
    }
    
})


route.post('/login',async(req,res,next)=>{
    // console.log(req,"req")
    let {userName,password}=req.body;
   if(userName!==""&&userName!==undefined&&password!==""&&password!==undefined){
    let response=await db.select('*').from('chatusers').where({userName}).catch(err => {
        res.send({
            status:false,
            msg:'Invalid username or password',
            isAdmin:"N"
         })
         console.log("err");
         return false
     })
     if(response.length){
         if(userName===response[0]["userName"]&&password===response[0]["password"]){
             let token=uuid.v4()
             let checkLastLogin=await db("token").where({userid:response[0]["id"]})
             if(checkLastLogin.length>0){
                 let CreateToken=await db("token").where({id:checkLastLogin[0]["id"]}).update({userid:response[0]["id"],token,timestamp:new Date().toISOString().slice(0, 10)+" "+new Date().toLocaleTimeString('en-GB')          })
             }else{
                 let CreateToken=await db("token").insert({userid:response[0]["id"],token})
             }
             
             let successfull_logins=await db("successfull_logins").insert({userid:checkLastLogin[0]["id"]})
 
             res.send({
                 status:true,
                 msg:"Valid user",
                 data:response[0],
                 isAdmin:response[0]["IsAdmin"]?response[0]["IsAdmin"]:"N",
                 token:token
             })
         }else{
             res.send({
                 status:true,
                 msg:"Invalid password",
             })
         }
     }else{
         res.send({
             status:false,
             msg:"User doesn't exist",
         })
     }
   }else{
    res.send({
        status:false,
        msg:'please provide username and password',
     })
   }
})
module.exports={
    chatRouter:route
}