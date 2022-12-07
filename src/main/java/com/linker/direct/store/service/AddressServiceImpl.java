package com.linker.direct.store.service;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class AddressServiceImpl implements AddressService {

    private final AddressService addressService;

    @Override
    public List<Address> listAll() throws Exception {
        return addressService.listAll();
    }
}
