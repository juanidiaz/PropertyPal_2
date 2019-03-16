module.exports = function(sequelize, DataTypes) {
  var client = sequelize.define("client", {
    username: {
      type: DataTypes.STRING,
      allowNull: false
    },
    password: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    firstName: {
      type: DataTypes.STRING,
      allowNull: false
    },
    lastName: {
      type: DataTypes.STRING,
      allowNull: false
    },

    email: {
      type: DataTypes.STRING,
      allowNull: false
    },
    phone: {
      type: DataTypes.STRING,
      allowNull: false
    }
  });

  client.associate = function(models) {
    client.hasMany(models.favorite, {
      onDelete: "cascade"
    });
    client.belongsTo(models.seenby, {});
  };

  return client;
};
