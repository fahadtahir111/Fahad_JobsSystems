local MarkerManager = {}

function MarkerManager.DrawMarker(coords, markerData)
    DrawMarker(
        markerData.type,
        coords.x, coords.y, coords.z - 1.0,
        0.0, 0.0, 0.0,
        0.0, 0.0, 0.0,
        markerData.scale.x, markerData.scale.y, markerData.scale.z,
        markerData.color.x, markerData.color.y, markerData.color.z, markerData.color.w,
        false, false, 2, false, nil, nil, false
    )
end

return MarkerManager