const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	// req.session.is_loggedin = false;
	// if(req.session.is_loggedin === false){
	// }
		req.session.is_loggedin = false;
		db.query(`SELECT * FROM program_events`, (err, rows) => {
			req.session.email = 'guest@dolphincove';
			if(err) {
				res.render('errors', {
					error: err,
					layout: false
				})
				return
			}
			res.render('index', { 
				page_title: 'Home',
				events: rows,
			})
		})
	
		
})

module.exports = router
