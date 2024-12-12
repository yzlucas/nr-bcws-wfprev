export class Project {
    projectTypeCode?: { projectTypeCode: string };
    projectNumber?: number;
    siteUnitName?: string;
    forestAreaCode?: { forestAreaCode: string };
    generalScopeCode?: { generalScopeCode: string };
    programAreaGuid?: string;
    projectName?: string;
    projectLead?: string;
    projectLeadEmailAddress?: string;
    projectDescription?: string;
    closestCommunityName?: string;
    totalFundingRequestAmount?: number;
    totalAllocatedAmount?: number;
    totalPlannedProjectSizeHa?: number;
    totalPlannedCostPerHectare?: number;
    totalActualAmount?: number;
    isMultiFiscalYearProj?: boolean;
    forestRegionOrgUnitId?: number;
    forestDistrictOrgUnitId?: number;
    fireCentreOrgUnitId?: number;
    bcParksRegionOrgUnitId?: number;
    bcParksSectionOrgUnitId?: number;
    
    constructor(init?: Partial<Project>) {
        Object.assign(this, init); // Assign provided values to class properties
      }
  }
  