Config = {}

Config.HarvestItems = {
    wire = {
        label = "Wire",
        blip = {
            coords = vec3(2278.3455, 2969.6851, 46.5810),
            sprite = 353,
            color = 1,
            scale = 0.8,
            label = "Wire Plant"
        },
        marker = {
            type = 1,
            scale = vec3(1.0, 1.0, 1.0),
            color = vec4(255, 0, 0, 100)
        },
        zones = {
            {
                coords = vec3(2280.46, 2972.64, 46.75),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = false,
                    model = 'mp_m_shopkeep_01',
                    heading = 180.0,
                    scenario = "WORLD_HUMAN_CLIPBOARD"
                }
            },
            {
                coords = vec3(2280.57, 2966.82, 46.75),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = false,
                    model = 'mp_m_shopkeep_01',
                    heading = 90.0,
                    scenario = "WORLD_HUMAN_CLIPBOARD"
                }
            },
        },
        animation = {
            dict = "mp_car_bomb",
            clip = "car_bomb_mechanic"
        },
        reward = {
            item = "wire",
            amount = 1
        }
    },
    milk = {
        label = "Milk",
        blip = {
            coords = vec3(2441.1082, 4736.6328, 34.3004),
            sprite = 478,
            color = 2,
            scale = 0.8,
            label = "Milk Harvest"
        },
        marker = {
            type = 2,
            scale = vec3(1.0, 1.0, 1.0),
            color = vec4(0, 255, 0, 200)
        },
        zones = {
            {
                coords = vec3(2441.1082, 4736.6328, 34.3004),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = true,
                    model = 'a_c_cow',
                    heading = 180.0,
                    scenario = "WORLD_COW_GRAZING"
                }
            },
            {
                coords = vec3(2432.3083, 4745.8359, 34.3040),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = true,
                    model = 'a_c_cow',
                    heading = 270.0,
                    scenario = "WORLD_COW_GRAZING"
                }
            },
        },
        animation = {
            dict = "mp_car_bomb",
            clip = "car_bomb_mechanic"
        },
        reward = {
            item = "water",
            amount = 1
        }
    },
    bitcoin = {
        label = "Bitcoin",
        blip = {
            coords = vec3(-1057.59, -244.39, 44.02),
            sprite = 103,
            color = 1,
            scale = 0.8,
            label = "Bitcoin"
        },
        marker = {
            type = 1,
            scale = vec3(1.0, 1.0, 1.0),
            color = vec4(255, 140, 0, 100)
        },
        zones = {
            {
                coords = vec3(-1057.59, -244.39, 44.02),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = false,
                    model = 's_m_m_scientist_01',
                    heading = 180.0,
                    scenario = "WORLD_HUMAN_CLIPBOARD"
                }
            },
            {
                coords = vec3(-1055.60, -242.84, 44.02),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = false,
                    model = 's_m_m_scientist_01',
                    heading = 180.0,
                    scenario = "WORLD_HUMAN_CLIPBOARD"
                }
            },
            {
                coords = vec3(-1050.25, -242.76, 44.02),
                radius = 1.0,
                cooldown = 5000,
                ped = {
                    enabled = false,
                    model = 's_m_m_scientist_01',
                    heading = 180.0,
                    scenario = "WORLD_HUMAN_CLIPBOARD"
                }
            }
        },
        animation = {
            dict = "missbigscore2aswitch",
            clip = "switch_mic_car_fra_laptop_laptop2"
        },
        reward = {
            item = "bitcoin",
            amount = 1
        }
    }
}

Config.SellingPoints = {
    {
        name = "ILLEGAL SELLER",
        coords = vector3(139.7201, 493.7743, 145.3174),
        heading = 270.0,
        pedModel = "mp_m_shopkeep_01",
        items = {
            {
                name = "water", 
                price = 1000,
                currency = "black_money"  -- Specify currency per item
            },
            {
                name = "bitcoin", 
                price = 1500,
                currency = "black_money"
            },
        },
        blip = {
            sprite = 478,
            color = 1,
            scale = 0.8,
            name = "ILLEGAL SELLER",
        }
    },
    {
        name = "LEGAL SELLER",
        coords = vector3(242.8521, -1068.7468, 29.2940),
        heading = 180.0,
        pedModel = "s_m_m_bouncer_01",
        items = {
            {
                name = "water", 
                price = 500,
                currency = "money"
            },
            {
                name = "burger", 
                price = 100,
                currency = "money"
            },
        },
        blip = {
            sprite = 478,
            color = 2,
            scale = 0.8,
            name = "LEGAL SELLER",
        }
    },
    {
        name = "TECH BUYER",
        coords = vector3(-1528.7816, -405.5868, 35.5969),
        heading = 230.0,
        pedModel = "s_m_m_scientist_01",
        items = {
            {
                name = "bitcoin", 
                price = 800,
                currency = "money"
            },
        },
        blip = {
            sprite = 521,
            color = 3,
            scale = 0.8,
            name = "TECH BUYER",
        }
    }
}
