const port=3080

const express =require('express');
const app = require('express')();
const multer=require('multer');
const upload=multer({dist:'uploads/'});
const {chatRouter}=require('./Routes/ChatRoute')

const cors = require('cors')

app.use(cors({
    origin: [
        "http://localhost:3000"
    ],
  
    methods: "GET,POST",
    optionsSuccessStatus: 200,
    credentials: true,
  }))

//   app.use(express.json());
//   app.use(express.urlencoded({extended:true}));

//   app.use(cookieParser());

app.use(upload.any());
app.use('/chat', chatRouter)

app.listen(port,()=>{
    console.log(`Server is working on Port : ${port} `)
})