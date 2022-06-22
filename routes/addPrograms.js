const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	if(req.session.is_loggedin) {
        res.render('add-program',{
            page_title: 'Add Program',
            layout : 'layouts/staff-layout'
        })
    } else {
        res.redirect('/officials')
    }
})

router.post('/', (req, res) => {
    let sql = `INSERT INTO program_events SET ?`
    // let event = req.body
    let file = req.files.cover;
    let filePath = "/assets/images/" + file.name;
    // file.mv(filePath);
    file.mv(filePath);
    let event = {
        cover : filePath,
        program : req.body.program,
        title : req.body.title,
        description : req.body.description,
        cost : req.body.cost,
        time_schedule : req.body.time_schedule
    }

    db.query(sql, event, (err, results) => {
        if(err){res.send('this is the error ' + err)}
        res.send(results)
    })
})


module.exports = router
