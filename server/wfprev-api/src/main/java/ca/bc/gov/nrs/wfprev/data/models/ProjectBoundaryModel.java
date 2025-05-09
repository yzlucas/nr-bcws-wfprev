package ca.bc.gov.nrs.wfprev.data.models;

import ca.bc.gov.nrs.wfprev.common.entities.CommonModel;
import ca.bc.gov.nrs.wfprev.common.validators.NotEmptyProjectBoundary;
import ca.bc.gov.nrs.wfprev.common.validators.ProjectBoundaryTimestamps;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonInclude.Include;
import com.fasterxml.jackson.annotation.JsonRootName;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.locationtech.jts.geom.MultiPolygon;
import org.locationtech.jts.geom.Point;
import org.springframework.hateoas.server.core.Relation;

import java.math.BigDecimal;
import java.util.Date;

@ProjectBoundaryTimestamps
@NotEmptyProjectBoundary
@Data
@EqualsAndHashCode(callSuper = false)
@JsonRootName(value = "projectBoundary")
@Relation(collectionRelation = "projectBoundary")
@JsonInclude(Include.NON_NULL)
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProjectBoundaryModel extends CommonModel<ProjectBoundaryModel> {
  	private String projectBoundaryGuid;
	@NotNull(message = "ProjectBoundary projectGuid must not be null")
	private String projectGuid;
	@NotNull(message = "ProjectBoundary systemStartTimestamp must not be null")
	private Date systemStartTimestamp;
	@NotNull(message = "ProjectBoundary systemEndTimestamp must not be null")
	private Date systemEndTimestamp;
	private String mappingLabel;
	@NotNull(message = "ProjectBoundary collectionDate must not be null")
	private Date collectionDate;
	private String collectionMethod;
	private String collectorName;
	private BigDecimal boundarySizeHa;
	private String boundaryComment;
	private Point locationGeometry;
	@NotNull(message = "ProjectBoundary boundaryGeometry must not be null")
	private MultiPolygon boundaryGeometry;
}
