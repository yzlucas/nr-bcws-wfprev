package ca.bc.gov.nrs.wfprev.data.assemblers;

import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.linkTo;
import static org.springframework.hateoas.server.mvc.WebMvcLinkBuilder.methodOn;

import java.util.UUID;

import org.springframework.hateoas.CollectionModel;
import org.springframework.hateoas.server.mvc.RepresentationModelAssemblerSupport;
import org.springframework.stereotype.Component;

import ca.bc.gov.nrs.wfprev.common.enums.CodeTables;
import ca.bc.gov.nrs.wfprev.controllers.CodesController;
import ca.bc.gov.nrs.wfprev.data.entities.SilvicultureBaseEntity;
import ca.bc.gov.nrs.wfprev.data.models.SilvicultureBaseModel;

@Component
public class SilvicultureBaseResourceAssembler extends RepresentationModelAssemblerSupport<SilvicultureBaseEntity, SilvicultureBaseModel> {

    public SilvicultureBaseResourceAssembler() {
        super(CodesController.class, SilvicultureBaseModel.class);
    }

    public SilvicultureBaseEntity toEntity(SilvicultureBaseModel model) {
        if (model == null) {
            return null;
        }
        SilvicultureBaseEntity entity = new SilvicultureBaseEntity();

        entity.setSilvicultureBaseGuid(UUID.fromString(model.getSilvicultureBaseGuid()));
        entity.setProjectTypeCode(model.getProjectTypeCode());
        entity.setSilvicultureBaseCode(model.getSilvicultureBaseCode());
        entity.setRevisionCount(model.getRevisionCount());
        entity.setCreateUser(model.getCreateUser());
        entity.setCreateDate(model.getCreateDate());
        entity.setUpdateUser(model.getUpdateUser());
        entity.setUpdateDate(model.getUpdateDate());

        return entity;
    }

    @Override
    public SilvicultureBaseModel toModel(SilvicultureBaseEntity entity) {
        SilvicultureBaseCodeModel model = instantiateModel(entity);

        model.add(linkTo(
                methodOn(CodesController.class)
                        .getCodeById(CodeTables.SILVICULTURE_BASE_CODE, entity.getSilvicultureBaseGuid().toString()))
                .withSelfRel());

        model.setSilvicultureBaseGuid(entity.getSilvicultureBaseGuid().toString());
        model.setSilvicultureBaseName(entity.getSilvicultureBaseName());
        model.setSilvicultureBaseAbbreviation(entity.getSilvicultureBaseAbbreviation());
        model.setRevisionCount(entity.getRevisionCount());
        model.setCreateUser(entity.getCreateUser());
        model.setCreateDate(entity.getCreateDate());
        model.setUpdateUser(entity.getUpdateUser());
        model.setUpdateDate(entity.getUpdateDate());

        return model;
    }

    @Override
    public CollectionModel<SilvicultureBaseCodeModel> toCollectionModel(Iterable<? extends SilvicultureBaseCodeEntity> entities) {
        CollectionModel<SilvicultureBaseCodeModel> resources = super.toCollectionModel(entities);

        resources.add(linkTo(methodOn(CodesController.class).getCodes(CodeTables.SILVICULTURE_BASE_CODE)).withSelfRel());

        return resources;
    }
}
