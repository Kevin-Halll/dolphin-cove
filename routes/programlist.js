const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	db.query(`SELECT * FROM program_events`, (err, rows) => {
		if(err) {
            res.render('errors', {
                error: err,
                layout: false
            })
            return
        }
		res.render('programlist', { 
			page_title: 'Program List',
			events: rows,
            // member_num : req.session.member_num
		 })
        //  console.log(req.session.member_num + ' new log');
	})
})

module.exports = router
