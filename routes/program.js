const express = require('express')
const router = express.Router()
const db = require('../lib/db')

router.get('/:id', (req, res) => {
	db.query(`SELECT * FROM program_events WHERE id = ${req.params.id}`, (err, rows) => {
		db.query(`SELECT * FROM payment_method ORDER BY id`, (errors, method) => {
            db.query(`SELECT * FROM hotels`, (error, data) => {
                if(err, error, errors) {
                    res.render('errors', {
                        error: err,
                        error: error,
                        error, errors,
                        layout: false
                    })
                    return
                }   
                res.render('programs', { 
                    page_title: 'Programs',
                    program: rows[0],
                    hotels: data,
                    methods: method,
                    user_id : req.session.user_id
                })
            
            })
        })
	})
})

router.post('/', (req, res) => {
    let sql = "INSERT INTO booking SET ?"
    let sql2 = "INSERT INTO payments SET ?"
    let sql3 = "INSERT INTO voucher SET ?"
    booking = {
        program_id : req.body.program_id,
        fname : req.body.fname,
        lname : req.body.lname,
        participant_num : req.body.participant_num,
        hotel : req.body.hotel,
        booked_dt : req.body.booked_dt,
        appointment_dt : req.body.appointment_dt,
        user_id: req.session.user_id || 0,
    }
    
    db.query(sql, booking, (err, results) => {

        payment = {
            booking_id : results.insertId,
            payment_method_id : req.body.method,
            payment_dt : req.body.booked_dt,
            payment_total : req.body.g_total2,
            payment_status : req.body.pay_stats
        }
        
        db.query(sql2, payment, (error, data) => {
            voucher = {
                booking_id : results.insertId,
                payment_id : data.insertId,
            }

            db.query(sql3, voucher, (errors, voucher) => {
                if(err, error, errors) {
                    res.render('errors', {
                        error: err,
                        error: error,
                        error: errors,
                        layout: false
                    })
                    return
                } 

                db.query(`SELECT * FROM dolphin_cove.voucher vt JOIN dolphin_cove.booking bt JOIN dolphin_cove.payments pt ON vt.booking_id = bt.id AND vt.payment_id = pt.id WHERE bt.id = ${results.insertId} AND pt.id = ${data.insertId};`, (err, rows) => {
                    db.query(`SELECT * FROM program_events WHERE id = ${rows[0].program_id}`, (error, data) => {
                        if(err, error) {
                            res.render('errors', {
                                error: err,
                                error: error,
                                layout: false
                            })
                            return
                        } 
                        res.render('voucher', {
                            page_title: 'voucher',
                            voucher: rows[0],
                            time: data[0]
        
                        })
                    })
                })
    
            })
        })

        // res.send(results)
        console.log("booking route " + req.session.user_id);
    })
})
module.exports = router
