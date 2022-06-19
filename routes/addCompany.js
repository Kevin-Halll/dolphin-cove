const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/', (req, res) => {
	if(req.session.is_loggedin){
        res.render('addCompany',{
            page_title: 'Add Company',
            layout : 'layouts/staff-layout',
        })
    }else{
        res.redirect('/officials')
    }
})

router.post('/', (req, res) => {
    sql = `INSERT INTO tour_companies SET ?`;
    sql2 = `INSERT INTO users SET ?`;

    company_info = {
        company_nm : req.body.company_nm,
        phone_num : req.body.phone_num,
        email : req.body.email
    }

    db.query(sql, company_info, (err, results) => {
        if(err) {
            res.render('errors', {
                error: err,
                layout: false
            })
            return
        }
        company_user = {
            user_nm : req.body.company_nm,
            email : req.body.email,
            password : req.body.password,
            role_id : req.body.role_id
        }
        
        db.query(sql2, company_user, (error, comp_user) => {
            if(err) {
				res.render('errors', {
					error: err,
					layout: false
				})
				return
			}
            db.query(`SELECT * FROM tour_companies WHERE id = ${results.insertId}`, (errors, data) => {
                if(req.session.is_loggedin) {
                    res.render('company-add-confirm', {
                        page_title : 'Company Add Confirmation',
                        company : data[0],
                        layout : 'layouts/staff-layout'
                    })
                }else {res.redirect('/officials')}
            })
        })
    })
})

module.exports = router
