require('dotenv').config()
const express = require('express')
const session = require('express-session')
const expressLayouts = require('express-ejs-layouts')
const cors = require('cors')
const path = require('path')
const flash = require('express-flash')
const fileUpload = require('express-fileupload')
const app = express()

const PORT = process.env.APP_PORT || 8080
const APP_NAME = process.env.APP_NAME || 'Express App'

// Express configs
app.set('view engine', 'ejs')
app.set('layout', 'layouts/layout')

// Middlewares
app.use(expressLayouts)
app.use(express.json())
app.use(express.urlencoded({ extended: true }))
app.use(express.static(path.join(__dirname, 'public')))
app.use(cors(['*']))
app.use(flash())
app.use(fileUpload({
	createParentPath : true
}))
app.use(
	session({
		secret: process.env.APP_SESSION_SECRET || 'secret8080',
		resave: false,
		saveUninitialized: false,
		cookie: {
			maxAge: 1000 * 60 * 60 * 24, // day in milliseconds
		},
	})
)

// View Routes
app.use('/', require('./routes/index'))
app.use('/program', require('./routes/program'))
app.use('/program-list', require('./routes/programlist'))
app.use('/program/make/booking', require('./routes/program'))
app.use('/voucher', require('./routes/voucher'))
app.use('/officials', require('./routes/officials'))
app.use('/login/user', require('./routes/officials'))
app.use('/user', require('./routes/officials'))
app.use('/tour-companies', require('./routes/tourComp'))
app.use('/staff', require('./routes/tourComp'))
app.use('/add-company', require('./routes/addCompany'))
app.use('/add/company', require('./routes/addCompany'))
app.use('/add-program', require('./routes/addPrograms'))
app.use('/add/program', require('./routes/addPrograms'))
app.use('/staff/bookings', require('./routes/bookingList'))
app.use('/accounts', require('./routes/accounts'))

// ////////////////////// TOUR COMPANY //////////////////////////////
app.use('/tour/bookings', require('./routes/tour_comp_admin/bookings'))
app.use('/tour/programs', require('./routes/tour_comp_admin/createBooking'))
app.use('/tour', require('./routes/tour_comp_admin/createBooking'))
app.use('/program/make/booking', require('./routes/tour_comp_admin/createBooking'))
app.use('/tour-vouchers', require('./routes/tour_comp_admin/tourVouchers'))
// app.use('/tour-vouchers', require('./routes/tour_comp_admin/tourVouchers'))



// Start express app
app.listen(PORT, () => {
	console.log(`${APP_NAME} listening on http://localhost:${PORT}`)
})
