module.exports = function(sequelize, DataTypes) {
  var property = sequelize.define("property", {
    info: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    address1: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    address2: {
      type: DataTypes.STRING,
      allowNull: false
    },
    postalcode: {
      type: DataTypes.STRING,
      allowNull: false
    },
    propertype: {
      type: DataTypes.STRING,
      defaultValue: ""
    },
    price_string: {
      type: DataTypes.STRING,
      allowNull: false
    },
    price_dec: {
      type: DataTypes.DECIMAL(10, 2),
      allowNull: false
    },
    bedrooms: {
      type: DataTypes.STRING
    },
    bathrooms: {
      type: DataTypes.STRING
    },
    ownershiptype: {
      type: DataTypes.STRING
    },
    ammenities: {
      type: DataTypes.STRING
    },
    ammenitiesnearby: {
      type: DataTypes.STRING
    },
    photo: {
      type: DataTypes.TEXT
    }
  });

  property.associate = function(models) {
    property.belongsTo(models.owner, {
      foreignKey: {
        allowNull: false
      }
    });
    property.hasMany(models.favorite, {
      onDelete: "cascade"
    });
  };

  return property;
};
