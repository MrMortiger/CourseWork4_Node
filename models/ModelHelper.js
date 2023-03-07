class ModelHelper {
  constructor(models) {
    this.models = models;
  }

  getModel(name) {
    return this.models[name];
  }

  findAll(name, options = {}) {
    const Model = this.getModel(name);
    return Model.findAll(options);
  }

  findByPk(name, id, options = {}) {
    const Model = this.getModel(name);
    return Model.findByPk(id, options);
  }

  create(name, data) {
    const Model = this.getModel(name);
    return Model.create(data);
  }

  bulkCreate(name, data) {
    const Model = this.getModel(name);
    return Model.bulkCreate(data);
  }

  update(name, data, options = {}) {
    const Model = this.getModel(name);
    return Model.update(data, options);
  }

  destroy(name, options = {}) {
    const Model = this.getModel(name);
    return Model.destroy(options);
  }
}

module.exports = ModelHelper;