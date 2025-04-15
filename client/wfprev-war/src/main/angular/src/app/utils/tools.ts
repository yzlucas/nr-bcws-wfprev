import L from "leaflet";

// Parse latitude/longitude string from various formats
export function parseLatLong(latLong: string): { latitude: number; longitude: number } | null {
  const regexWithDirection = /^(-?\d+(\.\d+)?)°?\s*[N]?,?\s*(-?\d+(\.\d+)?)°?\s*[W]?$/;
  const regexWithoutDirection = /^(-?\d+(\.\d+)?),\s*(-?\d+(\.\d+)?)$/;

  let match = latLong.match(regexWithDirection);
  if (!match) {
    match = latLong.match(regexWithoutDirection);
  }

  if (match) {
    return {
      latitude: parseFloat(match[1]),
      longitude: parseFloat(match[3]),
    };
  }
  return null;
}

// Validate latitude/longitude range and format
export function validateLatLong(latLong: string): { latitude: number; longitude: number } | false {
  const parsed = parseLatLong(latLong);
  if (parsed) {
    const { latitude, longitude } = parsed;

    // Validate latitude and longitude range for BC
    if (latitude >= 48.3 && latitude <= 60 && longitude >= -139 && longitude <= -114) {
      return { latitude, longitude };
    }
  }
  return false;
}

// Format latitude/longitude for display
export function formatLatLong(latitude: number, longitude: number): string {
  return `${latitude.toFixed(4)}° N, ${longitude.toFixed(4)}° W`;
}

export function convertFiscalYear(fiscalYear: number): string {
  return `${fiscalYear}/${(fiscalYear + 1).toString().slice(-2)}`;
}

export class LeafletLegendService {
  addLegend(map: L.Map, fiscalColorMap: Record<'past' | 'present' | 'future', string>): void {
    const legend = new L.Control({ position: 'bottomleft' }) as L.Control;
    legend.onAdd = () => {
      const div = L.DomUtil.create('div', 'legend');
      div.innerHTML = `
        <div class="legend-title">Polygon Colour Legend</div>
        <div class="legend-item">
          <span class="legend-color" style="background-color: #3f3f3f;"></span>
          Gross Project Boundary
        </div>
        <div class="legend-item">
          <span class="legend-color" style="background-color: ${fiscalColorMap.past};"></span>
          Past Fiscal Activities
        </div>
        <div class="legend-item">
          <span class="legend-color" style="background-color: ${fiscalColorMap.present};"></span>
          Present Fiscal Activities
        </div>
        <div class="legend-item">
          <span class="legend-color" style="background-color: ${fiscalColorMap.future};"></span>
          Future Fiscal Activities
        </div>
      `;
      return div;
    };

    legend.addTo(map);
  }
}

export function createFullPageControl(callback: () => void, iconPath: string = 'assets/full-image.svg'): L.Control {
  const fullScreenControl = new L.Control({ position: 'bottomright' });

  fullScreenControl.onAdd = () => {
    const container = L.DomUtil.create('div', 'leaflet-bar leaflet-control leaflet-control-custom');

    container.innerHTML = `
      <div style="display: flex; align-items: center; gap: 10px;">
        <span style="font-size: 15px; font-family: 'BCSans', 'Noto Sans', Verdana, Arial, sans-serif;">Full Page</span>
        <img src="${iconPath}" alt="Full screen" style="width: 19px; height: 19px;" />
      </div>
    `;

    container.style.backgroundColor = 'white';
    container.style.padding = '2px 6px';
    container.style.cursor = 'pointer';
    container.style.fontSize = '15px';
    container.style.boxShadow = '0px 4px 4px rgba(0, 0, 0, 0.25)';
    container.style.borderRadius = '6px';
    container.style.border = 'none';
    container.style.color = '#000';

    container.onclick = () => {
      callback();
    };

    return container;
  };

  return fullScreenControl;
}

