module.exports = function(sequelize, DataTypes) {
  var seenby = sequelize.define("seenby", {});

  seenby.associate = function(models) {
    // seenby.belongsTo(models.property, {
    //   foreignKey: {
    //     allowNull: false
    //   }
    // });
    seenby.hasMany(models.client, {
      onDelete: "cascade"
    });
    seenby.hasMany(models.property, {
      onDelete: "cascade"
    });
  };

  return seenby;
};
