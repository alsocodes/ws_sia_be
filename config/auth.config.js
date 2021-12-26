module.exports = {
    accessSecret: process.env.ACCESS_TOKEN_SECRET_KEY || 'alsoalso',
    refreshSecret: process.env.REFRESH_TOKEN_SECRET_KEY || 'alsoalso',
    jwtExp: '30d',
    jwtRefreshExp: '30d'
}
