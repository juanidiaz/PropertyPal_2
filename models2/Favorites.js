module.exports = function(sequelize, DataTypes) {
  var favorite = sequelize.define("favorite", {});

  favorite.associate = function(models) {
    favorite.belongsTo(models.client, {
      foreignKey: {
        allowNull: false
      }
    });
    favorite.hasMany(models.property, {});
  };

  return favorite;
};
