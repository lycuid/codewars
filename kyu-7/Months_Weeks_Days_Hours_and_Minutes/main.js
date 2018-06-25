// https://www.codewars.com/kata/5b2a10fe9e40b9b43d00008c

function displayValue(value) {
	const dx = {
		y: function() { return 365*this.d(); },
		m: function() { return 28*this.d(); },
		w: function() { return 7*this.d(); },
		d: function() { return 24*this.h(); },
		h: function() { return 60; },
	}
		  
	const ts = {
		years: function() { return Math.floor( value / dx.y() ); },
		months: function() { return Math.floor( (value - this.years()*dx.y()) / dx.m() ); },
		weeks: function() { return Math.floor( (value - (this.years()*dx.y()) - (this.months()*dx.m())) / dx.w() ); },
		days: function() { return Math.floor( (value - (this.years()*dx.y()) - (this.months()*dx.m()) - (this.weeks()*dx.w())) / dx.d() ); },
		hours: function() { return Math.floor( (value - (this.years()*dx.y()) - (this.months()*dx.m()) - (this.weeks()*dx.w()) - (this.days()*dx.d())) / dx.h() ); },
		minutes: function() { return value % 60; },
	}
	let ret = '';
	for (const t of Object.keys(ts)) {
		ret += ts[t]() > 0 ? `${ts[t]()} ${ts[t]() > 1 ? t : t.slice(0, -1)} `: ``;
	}
	return ret.length ? ret.slice(0, -1) : ret;
}

