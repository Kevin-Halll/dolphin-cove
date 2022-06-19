const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	res.render('login',{
        page_title: 'login',
        layout: false
    })
})

router.post("/", (req, res) => {
	let data = [req.body.email, req.body.password];
    
	let sql = `SELECT * FROM users WHERE email = ? AND password = ?;`;
	db.query(sql, data, (err, rows) => {
        if(err) {
            res.render('errors', {
                error: err,
                layout: false
            })
            return
        } 
		if (rows.length <= 0) {
            req.flash('error', 'Invalid Credentials, Please try again')
			res.redirect('back')
            return
		}
        
            req.session.is_loggedin = true;
            req.session.role_type = rows[0].role_id;
		    req.session.user_id = rows[0].id;
            console.log(req.session.user_id);
            // res.redirect('/program-list')
            if(rows[0].role_id == 3 && req.session.is_loggedin){
                res.render('staff', {
                    page_title: 'staff login',
                    layout: 'layouts/staff-layout'
                })
            }

            if(rows[0].role_id == 2 && req.session.is_loggedin){
                res.render('staff', {
                    page_title: 'Company login',
                    layout: 'layouts/company-layout'
                })
            }   
            
	});
  });

  router.get('/logout', (req, res) => {
    req.session.destroy()
    res.redirect('/')
  })
module.exports = router
